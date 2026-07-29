# Explore: explore_2314
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06943.view.lkml"
include: "/views/domain_45/view_06945.view.lkml"
include: "/views/domain_46/view_06946.view.lkml"
include: "/views/domain_47/view_06947.view.lkml"

explore: explore_2314 {
  label: "Explore Explore 2314"
  description: "Comprehensive analytics explore joining base view_06943 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06943
  
  always_filter: {
    filters: [view_06943.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06943.created_at_date: "7 days"]
    unless: [view_06943.id, view_06943.status]
  }

  join: view_06945 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06943.user_id} = ${view_06945.id} ;;
    required_joins: []
  }

  join: view_06946 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06943.account_id} = ${view_06946.account_id} ;;
    required_joins: [view_06945]
  }

  join: view_06947 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06943.category} = ${view_06947.category} ;;
  }

  access_filter: {
    field: view_06943.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06943.is_deleted} = false ;;
}
