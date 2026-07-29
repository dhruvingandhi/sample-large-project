# Explore: explore_2273
# Auto-generated LookML Explore File

include: "/views/domain_20/view_06820.view.lkml"
include: "/views/domain_22/view_06822.view.lkml"
include: "/views/domain_23/view_06823.view.lkml"
include: "/views/domain_24/view_06824.view.lkml"

explore: explore_2273 {
  label: "Explore Explore 2273"
  description: "Comprehensive analytics explore joining base view_06820 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06820
  
  always_filter: {
    filters: [view_06820.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06820.created_at_date: "7 days"]
    unless: [view_06820.id, view_06820.status]
  }

  join: view_06822 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06820.user_id} = ${view_06822.id} ;;
    required_joins: []
  }

  join: view_06823 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06820.account_id} = ${view_06823.account_id} ;;
    required_joins: [view_06822]
  }

  join: view_06824 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06820.category} = ${view_06824.category} ;;
  }

  access_filter: {
    field: view_06820.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06820.is_deleted} = false ;;
}
