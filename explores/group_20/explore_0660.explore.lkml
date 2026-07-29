# Explore: explore_0660
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01981.view.lkml"
include: "/views/domain_33/view_01983.view.lkml"
include: "/views/domain_34/view_01984.view.lkml"
include: "/views/domain_35/view_01985.view.lkml"

explore: explore_0660 {
  label: "Explore Explore 0660"
  description: "Comprehensive analytics explore joining base view_01981 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01981
  
  always_filter: {
    filters: [view_01981.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01981.created_at_date: "7 days"]
    unless: [view_01981.id, view_01981.status]
  }

  join: view_01983 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01981.user_id} = ${view_01983.id} ;;
    required_joins: []
  }

  join: view_01984 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01981.account_id} = ${view_01984.account_id} ;;
    required_joins: [view_01983]
  }

  join: view_01985 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01981.category} = ${view_01985.category} ;;
  }

  access_filter: {
    field: view_01981.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01981.is_deleted} = false ;;
}
