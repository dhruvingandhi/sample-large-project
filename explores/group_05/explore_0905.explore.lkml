# Explore: explore_0905
# Auto-generated LookML Explore File

include: "/views/domain_16/view_02716.view.lkml"
include: "/views/domain_18/view_02718.view.lkml"
include: "/views/domain_19/view_02719.view.lkml"
include: "/views/domain_20/view_02720.view.lkml"

explore: explore_0905 {
  label: "Explore Explore 0905"
  description: "Comprehensive analytics explore joining base view_02716 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02716
  
  always_filter: {
    filters: [view_02716.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02716.created_at_date: "7 days"]
    unless: [view_02716.id, view_02716.status]
  }

  join: view_02718 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02716.user_id} = ${view_02718.id} ;;
    required_joins: []
  }

  join: view_02719 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02716.account_id} = ${view_02719.account_id} ;;
    required_joins: [view_02718]
  }

  join: view_02720 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02716.category} = ${view_02720.category} ;;
  }

  access_filter: {
    field: view_02716.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02716.is_deleted} = false ;;
}
