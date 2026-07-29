# Explore: explore_0189
# Auto-generated LookML Explore File

include: "/views/domain_18/view_00568.view.lkml"
include: "/views/domain_20/view_00570.view.lkml"
include: "/views/domain_21/view_00571.view.lkml"
include: "/views/domain_22/view_00572.view.lkml"

explore: explore_0189 {
  label: "Explore Explore 0189"
  description: "Comprehensive analytics explore joining base view_00568 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00568
  
  always_filter: {
    filters: [view_00568.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00568.created_at_date: "7 days"]
    unless: [view_00568.id, view_00568.status]
  }

  join: view_00570 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00568.user_id} = ${view_00570.id} ;;
    required_joins: []
  }

  join: view_00571 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00568.account_id} = ${view_00571.account_id} ;;
    required_joins: [view_00570]
  }

  join: view_00572 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00568.category} = ${view_00572.category} ;;
  }

  access_filter: {
    field: view_00568.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00568.is_deleted} = false ;;
}
