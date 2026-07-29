# Explore: explore_3755
# Auto-generated LookML Explore File

include: "/views/domain_16/view_11266.view.lkml"
include: "/views/domain_18/view_11268.view.lkml"
include: "/views/domain_19/view_11269.view.lkml"
include: "/views/domain_20/view_11270.view.lkml"

explore: explore_3755 {
  label: "Explore Explore 3755"
  description: "Comprehensive analytics explore joining base view_11266 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11266
  
  always_filter: {
    filters: [view_11266.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11266.created_at_date: "7 days"]
    unless: [view_11266.id, view_11266.status]
  }

  join: view_11268 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11266.user_id} = ${view_11268.id} ;;
    required_joins: []
  }

  join: view_11269 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11266.account_id} = ${view_11269.account_id} ;;
    required_joins: [view_11268]
  }

  join: view_11270 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11266.category} = ${view_11270.category} ;;
  }

  access_filter: {
    field: view_11266.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11266.is_deleted} = false ;;
}
