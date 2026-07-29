# Explore: explore_2356
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07069.view.lkml"
include: "/views/domain_21/view_07071.view.lkml"
include: "/views/domain_22/view_07072.view.lkml"
include: "/views/domain_23/view_07073.view.lkml"

explore: explore_2356 {
  label: "Explore Explore 2356"
  description: "Comprehensive analytics explore joining base view_07069 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07069
  
  always_filter: {
    filters: [view_07069.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07069.created_at_date: "7 days"]
    unless: [view_07069.id, view_07069.status]
  }

  join: view_07071 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07069.user_id} = ${view_07071.id} ;;
    required_joins: []
  }

  join: view_07072 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07069.account_id} = ${view_07072.account_id} ;;
    required_joins: [view_07071]
  }

  join: view_07073 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07069.category} = ${view_07073.category} ;;
  }

  access_filter: {
    field: view_07069.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07069.is_deleted} = false ;;
}
