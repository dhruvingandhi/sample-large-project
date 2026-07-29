# Explore: explore_3456
# Auto-generated LookML Explore File

include: "/views/domain_19/view_10369.view.lkml"
include: "/views/domain_21/view_10371.view.lkml"
include: "/views/domain_22/view_10372.view.lkml"
include: "/views/domain_23/view_10373.view.lkml"

explore: explore_3456 {
  label: "Explore Explore 3456"
  description: "Comprehensive analytics explore joining base view_10369 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10369
  
  always_filter: {
    filters: [view_10369.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10369.created_at_date: "7 days"]
    unless: [view_10369.id, view_10369.status]
  }

  join: view_10371 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10369.user_id} = ${view_10371.id} ;;
    required_joins: []
  }

  join: view_10372 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10369.account_id} = ${view_10372.account_id} ;;
    required_joins: [view_10371]
  }

  join: view_10373 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10369.category} = ${view_10373.category} ;;
  }

  access_filter: {
    field: view_10369.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10369.is_deleted} = false ;;
}
