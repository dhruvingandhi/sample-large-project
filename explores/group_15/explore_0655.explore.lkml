# Explore: explore_0655
# Auto-generated LookML Explore File

include: "/views/domain_16/view_01966.view.lkml"
include: "/views/domain_18/view_01968.view.lkml"
include: "/views/domain_19/view_01969.view.lkml"
include: "/views/domain_20/view_01970.view.lkml"

explore: explore_0655 {
  label: "Explore Explore 0655"
  description: "Comprehensive analytics explore joining base view_01966 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01966
  
  always_filter: {
    filters: [view_01966.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01966.created_at_date: "7 days"]
    unless: [view_01966.id, view_01966.status]
  }

  join: view_01968 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01966.user_id} = ${view_01968.id} ;;
    required_joins: []
  }

  join: view_01969 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01966.account_id} = ${view_01969.account_id} ;;
    required_joins: [view_01968]
  }

  join: view_01970 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01966.category} = ${view_01970.category} ;;
  }

  access_filter: {
    field: view_01966.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01966.is_deleted} = false ;;
}
