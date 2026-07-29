# Explore: explore_2137
# Auto-generated LookML Explore File

include: "/views/domain_12/view_06412.view.lkml"
include: "/views/domain_14/view_06414.view.lkml"
include: "/views/domain_15/view_06415.view.lkml"
include: "/views/domain_16/view_06416.view.lkml"

explore: explore_2137 {
  label: "Explore Explore 2137"
  description: "Comprehensive analytics explore joining base view_06412 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06412
  
  always_filter: {
    filters: [view_06412.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06412.created_at_date: "7 days"]
    unless: [view_06412.id, view_06412.status]
  }

  join: view_06414 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06412.user_id} = ${view_06414.id} ;;
    required_joins: []
  }

  join: view_06415 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06412.account_id} = ${view_06415.account_id} ;;
    required_joins: [view_06414]
  }

  join: view_06416 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06412.category} = ${view_06416.category} ;;
  }

  access_filter: {
    field: view_06412.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06412.is_deleted} = false ;;
}
