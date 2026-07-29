# Explore: explore_3441
# Auto-generated LookML Explore File

include: "/views/domain_24/view_10324.view.lkml"
include: "/views/domain_26/view_10326.view.lkml"
include: "/views/domain_27/view_10327.view.lkml"
include: "/views/domain_28/view_10328.view.lkml"

explore: explore_3441 {
  label: "Explore Explore 3441"
  description: "Comprehensive analytics explore joining base view_10324 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10324
  
  always_filter: {
    filters: [view_10324.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10324.created_at_date: "7 days"]
    unless: [view_10324.id, view_10324.status]
  }

  join: view_10326 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10324.user_id} = ${view_10326.id} ;;
    required_joins: []
  }

  join: view_10327 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10324.account_id} = ${view_10327.account_id} ;;
    required_joins: [view_10326]
  }

  join: view_10328 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10324.category} = ${view_10328.category} ;;
  }

  access_filter: {
    field: view_10324.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10324.is_deleted} = false ;;
}
