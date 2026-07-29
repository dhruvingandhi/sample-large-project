# Explore: explore_1441
# Auto-generated LookML Explore File

include: "/views/domain_24/view_04324.view.lkml"
include: "/views/domain_26/view_04326.view.lkml"
include: "/views/domain_27/view_04327.view.lkml"
include: "/views/domain_28/view_04328.view.lkml"

explore: explore_1441 {
  label: "Explore Explore 1441"
  description: "Comprehensive analytics explore joining base view_04324 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04324
  
  always_filter: {
    filters: [view_04324.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04324.created_at_date: "7 days"]
    unless: [view_04324.id, view_04324.status]
  }

  join: view_04326 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04324.user_id} = ${view_04326.id} ;;
    required_joins: []
  }

  join: view_04327 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04324.account_id} = ${view_04327.account_id} ;;
    required_joins: [view_04326]
  }

  join: view_04328 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04324.category} = ${view_04328.category} ;;
  }

  access_filter: {
    field: view_04324.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04324.is_deleted} = false ;;
}
