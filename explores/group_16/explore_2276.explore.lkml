# Explore: explore_2276
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06829.view.lkml"
include: "/views/domain_31/view_06831.view.lkml"
include: "/views/domain_32/view_06832.view.lkml"
include: "/views/domain_33/view_06833.view.lkml"

explore: explore_2276 {
  label: "Explore Explore 2276"
  description: "Comprehensive analytics explore joining base view_06829 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06829
  
  always_filter: {
    filters: [view_06829.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06829.created_at_date: "7 days"]
    unless: [view_06829.id, view_06829.status]
  }

  join: view_06831 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06829.user_id} = ${view_06831.id} ;;
    required_joins: []
  }

  join: view_06832 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06829.account_id} = ${view_06832.account_id} ;;
    required_joins: [view_06831]
  }

  join: view_06833 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06829.category} = ${view_06833.category} ;;
  }

  access_filter: {
    field: view_06829.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06829.is_deleted} = false ;;
}
