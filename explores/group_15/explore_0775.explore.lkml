# Explore: explore_0775
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02326.view.lkml"
include: "/views/domain_28/view_02328.view.lkml"
include: "/views/domain_29/view_02329.view.lkml"
include: "/views/domain_30/view_02330.view.lkml"

explore: explore_0775 {
  label: "Explore Explore 0775"
  description: "Comprehensive analytics explore joining base view_02326 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02326
  
  always_filter: {
    filters: [view_02326.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02326.created_at_date: "7 days"]
    unless: [view_02326.id, view_02326.status]
  }

  join: view_02328 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02326.user_id} = ${view_02328.id} ;;
    required_joins: []
  }

  join: view_02329 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02326.account_id} = ${view_02329.account_id} ;;
    required_joins: [view_02328]
  }

  join: view_02330 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02326.category} = ${view_02330.category} ;;
  }

  access_filter: {
    field: view_02326.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02326.is_deleted} = false ;;
}
