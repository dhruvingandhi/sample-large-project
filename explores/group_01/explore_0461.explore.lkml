# Explore: explore_0461
# Auto-generated LookML Explore File

include: "/views/domain_34/view_01384.view.lkml"
include: "/views/domain_36/view_01386.view.lkml"
include: "/views/domain_37/view_01387.view.lkml"
include: "/views/domain_38/view_01388.view.lkml"

explore: explore_0461 {
  label: "Explore Explore 0461"
  description: "Comprehensive analytics explore joining base view_01384 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01384
  
  always_filter: {
    filters: [view_01384.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01384.created_at_date: "7 days"]
    unless: [view_01384.id, view_01384.status]
  }

  join: view_01386 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01384.user_id} = ${view_01386.id} ;;
    required_joins: []
  }

  join: view_01387 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01384.account_id} = ${view_01387.account_id} ;;
    required_joins: [view_01386]
  }

  join: view_01388 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01384.category} = ${view_01388.category} ;;
  }

  access_filter: {
    field: view_01384.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01384.is_deleted} = false ;;
}
