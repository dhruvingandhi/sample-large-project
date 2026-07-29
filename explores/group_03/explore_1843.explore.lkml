# Explore: explore_1843
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05530.view.lkml"
include: "/views/domain_32/view_05532.view.lkml"
include: "/views/domain_33/view_05533.view.lkml"
include: "/views/domain_34/view_05534.view.lkml"

explore: explore_1843 {
  label: "Explore Explore 1843"
  description: "Comprehensive analytics explore joining base view_05530 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05530
  
  always_filter: {
    filters: [view_05530.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05530.created_at_date: "7 days"]
    unless: [view_05530.id, view_05530.status]
  }

  join: view_05532 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05530.user_id} = ${view_05532.id} ;;
    required_joins: []
  }

  join: view_05533 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05530.account_id} = ${view_05533.account_id} ;;
    required_joins: [view_05532]
  }

  join: view_05534 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05530.category} = ${view_05534.category} ;;
  }

  access_filter: {
    field: view_05530.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05530.is_deleted} = false ;;
}
