# Explore: explore_0481
# Auto-generated LookML Explore File

include: "/views/domain_44/view_01444.view.lkml"
include: "/views/domain_46/view_01446.view.lkml"
include: "/views/domain_47/view_01447.view.lkml"
include: "/views/domain_48/view_01448.view.lkml"

explore: explore_0481 {
  label: "Explore Explore 0481"
  description: "Comprehensive analytics explore joining base view_01444 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01444
  
  always_filter: {
    filters: [view_01444.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01444.created_at_date: "7 days"]
    unless: [view_01444.id, view_01444.status]
  }

  join: view_01446 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01444.user_id} = ${view_01446.id} ;;
    required_joins: []
  }

  join: view_01447 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01444.account_id} = ${view_01447.account_id} ;;
    required_joins: [view_01446]
  }

  join: view_01448 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01444.category} = ${view_01448.category} ;;
  }

  access_filter: {
    field: view_01444.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01444.is_deleted} = false ;;
}
