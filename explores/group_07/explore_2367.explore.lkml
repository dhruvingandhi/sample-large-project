# Explore: explore_2367
# Auto-generated LookML Explore File

include: "/views/domain_02/view_07102.view.lkml"
include: "/views/domain_04/view_07104.view.lkml"
include: "/views/domain_05/view_07105.view.lkml"
include: "/views/domain_06/view_07106.view.lkml"

explore: explore_2367 {
  label: "Explore Explore 2367"
  description: "Comprehensive analytics explore joining base view_07102 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07102
  
  always_filter: {
    filters: [view_07102.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07102.created_at_date: "7 days"]
    unless: [view_07102.id, view_07102.status]
  }

  join: view_07104 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07102.user_id} = ${view_07104.id} ;;
    required_joins: []
  }

  join: view_07105 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07102.account_id} = ${view_07105.account_id} ;;
    required_joins: [view_07104]
  }

  join: view_07106 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07102.category} = ${view_07106.category} ;;
  }

  access_filter: {
    field: view_07102.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07102.is_deleted} = false ;;
}
