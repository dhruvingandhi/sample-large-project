# Explore: explore_1481
# Auto-generated LookML Explore File

include: "/views/domain_44/view_04444.view.lkml"
include: "/views/domain_46/view_04446.view.lkml"
include: "/views/domain_47/view_04447.view.lkml"
include: "/views/domain_48/view_04448.view.lkml"

explore: explore_1481 {
  label: "Explore Explore 1481"
  description: "Comprehensive analytics explore joining base view_04444 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04444
  
  always_filter: {
    filters: [view_04444.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04444.created_at_date: "7 days"]
    unless: [view_04444.id, view_04444.status]
  }

  join: view_04446 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04444.user_id} = ${view_04446.id} ;;
    required_joins: []
  }

  join: view_04447 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04444.account_id} = ${view_04447.account_id} ;;
    required_joins: [view_04446]
  }

  join: view_04448 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04444.category} = ${view_04448.category} ;;
  }

  access_filter: {
    field: view_04444.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04444.is_deleted} = false ;;
}
