# Explore: explore_2244
# Auto-generated LookML Explore File

include: "/views/domain_33/view_06733.view.lkml"
include: "/views/domain_35/view_06735.view.lkml"
include: "/views/domain_36/view_06736.view.lkml"
include: "/views/domain_37/view_06737.view.lkml"

explore: explore_2244 {
  label: "Explore Explore 2244"
  description: "Comprehensive analytics explore joining base view_06733 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06733
  
  always_filter: {
    filters: [view_06733.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06733.created_at_date: "7 days"]
    unless: [view_06733.id, view_06733.status]
  }

  join: view_06735 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06733.user_id} = ${view_06735.id} ;;
    required_joins: []
  }

  join: view_06736 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06733.account_id} = ${view_06736.account_id} ;;
    required_joins: [view_06735]
  }

  join: view_06737 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06733.category} = ${view_06737.category} ;;
  }

  access_filter: {
    field: view_06733.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06733.is_deleted} = false ;;
}
