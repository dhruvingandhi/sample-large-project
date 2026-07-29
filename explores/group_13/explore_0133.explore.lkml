# Explore: explore_0133
# Auto-generated LookML Explore File

include: "/views/domain_50/view_00400.view.lkml"
include: "/views/domain_02/view_00402.view.lkml"
include: "/views/domain_03/view_00403.view.lkml"
include: "/views/domain_04/view_00404.view.lkml"

explore: explore_0133 {
  label: "Explore Explore 0133"
  description: "Comprehensive analytics explore joining base view_00400 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00400
  
  always_filter: {
    filters: [view_00400.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00400.created_at_date: "7 days"]
    unless: [view_00400.id, view_00400.status]
  }

  join: view_00402 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00400.user_id} = ${view_00402.id} ;;
    required_joins: []
  }

  join: view_00403 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00400.account_id} = ${view_00403.account_id} ;;
    required_joins: [view_00402]
  }

  join: view_00404 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00400.category} = ${view_00404.category} ;;
  }

  access_filter: {
    field: view_00400.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00400.is_deleted} = false ;;
}
