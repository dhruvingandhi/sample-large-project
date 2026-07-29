# Explore: explore_2481
# Auto-generated LookML Explore File

include: "/views/domain_44/view_07444.view.lkml"
include: "/views/domain_46/view_07446.view.lkml"
include: "/views/domain_47/view_07447.view.lkml"
include: "/views/domain_48/view_07448.view.lkml"

explore: explore_2481 {
  label: "Explore Explore 2481"
  description: "Comprehensive analytics explore joining base view_07444 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07444
  
  always_filter: {
    filters: [view_07444.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07444.created_at_date: "7 days"]
    unless: [view_07444.id, view_07444.status]
  }

  join: view_07446 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07444.user_id} = ${view_07446.id} ;;
    required_joins: []
  }

  join: view_07447 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07444.account_id} = ${view_07447.account_id} ;;
    required_joins: [view_07446]
  }

  join: view_07448 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07444.category} = ${view_07448.category} ;;
  }

  access_filter: {
    field: view_07444.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07444.is_deleted} = false ;;
}
