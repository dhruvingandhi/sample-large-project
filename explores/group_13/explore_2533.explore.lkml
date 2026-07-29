# Explore: explore_2533
# Auto-generated LookML Explore File

include: "/views/domain_50/view_07600.view.lkml"
include: "/views/domain_02/view_07602.view.lkml"
include: "/views/domain_03/view_07603.view.lkml"
include: "/views/domain_04/view_07604.view.lkml"

explore: explore_2533 {
  label: "Explore Explore 2533"
  description: "Comprehensive analytics explore joining base view_07600 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07600
  
  always_filter: {
    filters: [view_07600.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07600.created_at_date: "7 days"]
    unless: [view_07600.id, view_07600.status]
  }

  join: view_07602 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07600.user_id} = ${view_07602.id} ;;
    required_joins: []
  }

  join: view_07603 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07600.account_id} = ${view_07603.account_id} ;;
    required_joins: [view_07602]
  }

  join: view_07604 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07600.category} = ${view_07604.category} ;;
  }

  access_filter: {
    field: view_07600.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07600.is_deleted} = false ;;
}
