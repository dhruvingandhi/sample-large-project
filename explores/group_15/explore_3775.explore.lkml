# Explore: explore_3775
# Auto-generated LookML Explore File

include: "/views/domain_26/view_11326.view.lkml"
include: "/views/domain_28/view_11328.view.lkml"
include: "/views/domain_29/view_11329.view.lkml"
include: "/views/domain_30/view_11330.view.lkml"

explore: explore_3775 {
  label: "Explore Explore 3775"
  description: "Comprehensive analytics explore joining base view_11326 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11326
  
  always_filter: {
    filters: [view_11326.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11326.created_at_date: "7 days"]
    unless: [view_11326.id, view_11326.status]
  }

  join: view_11328 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11326.user_id} = ${view_11328.id} ;;
    required_joins: []
  }

  join: view_11329 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11326.account_id} = ${view_11329.account_id} ;;
    required_joins: [view_11328]
  }

  join: view_11330 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11326.category} = ${view_11330.category} ;;
  }

  access_filter: {
    field: view_11326.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11326.is_deleted} = false ;;
}
