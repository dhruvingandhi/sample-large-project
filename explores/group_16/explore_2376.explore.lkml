# Explore: explore_2376
# Auto-generated LookML Explore File

include: "/views/domain_29/view_07129.view.lkml"
include: "/views/domain_31/view_07131.view.lkml"
include: "/views/domain_32/view_07132.view.lkml"
include: "/views/domain_33/view_07133.view.lkml"

explore: explore_2376 {
  label: "Explore Explore 2376"
  description: "Comprehensive analytics explore joining base view_07129 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07129
  
  always_filter: {
    filters: [view_07129.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07129.created_at_date: "7 days"]
    unless: [view_07129.id, view_07129.status]
  }

  join: view_07131 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07129.user_id} = ${view_07131.id} ;;
    required_joins: []
  }

  join: view_07132 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07129.account_id} = ${view_07132.account_id} ;;
    required_joins: [view_07131]
  }

  join: view_07133 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07129.category} = ${view_07133.category} ;;
  }

  access_filter: {
    field: view_07129.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07129.is_deleted} = false ;;
}
