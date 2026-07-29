# Explore: explore_0360
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01081.view.lkml"
include: "/views/domain_33/view_01083.view.lkml"
include: "/views/domain_34/view_01084.view.lkml"
include: "/views/domain_35/view_01085.view.lkml"

explore: explore_0360 {
  label: "Explore Explore 0360"
  description: "Comprehensive analytics explore joining base view_01081 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01081
  
  always_filter: {
    filters: [view_01081.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01081.created_at_date: "7 days"]
    unless: [view_01081.id, view_01081.status]
  }

  join: view_01083 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01081.user_id} = ${view_01083.id} ;;
    required_joins: []
  }

  join: view_01084 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01081.account_id} = ${view_01084.account_id} ;;
    required_joins: [view_01083]
  }

  join: view_01085 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01081.category} = ${view_01085.category} ;;
  }

  access_filter: {
    field: view_01081.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01081.is_deleted} = false ;;
}
