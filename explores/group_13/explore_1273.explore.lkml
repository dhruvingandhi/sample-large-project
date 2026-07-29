# Explore: explore_1273
# Auto-generated LookML Explore File

include: "/views/domain_20/view_03820.view.lkml"
include: "/views/domain_22/view_03822.view.lkml"
include: "/views/domain_23/view_03823.view.lkml"
include: "/views/domain_24/view_03824.view.lkml"

explore: explore_1273 {
  label: "Explore Explore 1273"
  description: "Comprehensive analytics explore joining base view_03820 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03820
  
  always_filter: {
    filters: [view_03820.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03820.created_at_date: "7 days"]
    unless: [view_03820.id, view_03820.status]
  }

  join: view_03822 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03820.user_id} = ${view_03822.id} ;;
    required_joins: []
  }

  join: view_03823 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03820.account_id} = ${view_03823.account_id} ;;
    required_joins: [view_03822]
  }

  join: view_03824 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03820.category} = ${view_03824.category} ;;
  }

  access_filter: {
    field: view_03820.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03820.is_deleted} = false ;;
}
