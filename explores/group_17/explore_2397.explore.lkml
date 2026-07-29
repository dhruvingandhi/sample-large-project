# Explore: explore_2397
# Auto-generated LookML Explore File

include: "/views/domain_42/view_07192.view.lkml"
include: "/views/domain_44/view_07194.view.lkml"
include: "/views/domain_45/view_07195.view.lkml"
include: "/views/domain_46/view_07196.view.lkml"

explore: explore_2397 {
  label: "Explore Explore 2397"
  description: "Comprehensive analytics explore joining base view_07192 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07192
  
  always_filter: {
    filters: [view_07192.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07192.created_at_date: "7 days"]
    unless: [view_07192.id, view_07192.status]
  }

  join: view_07194 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07192.user_id} = ${view_07194.id} ;;
    required_joins: []
  }

  join: view_07195 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07192.account_id} = ${view_07195.account_id} ;;
    required_joins: [view_07194]
  }

  join: view_07196 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07192.category} = ${view_07196.category} ;;
  }

  access_filter: {
    field: view_07192.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07192.is_deleted} = false ;;
}
