# Explore: explore_3367
# Auto-generated LookML Explore File

include: "/views/domain_02/view_10102.view.lkml"
include: "/views/domain_04/view_10104.view.lkml"
include: "/views/domain_05/view_10105.view.lkml"
include: "/views/domain_06/view_10106.view.lkml"

explore: explore_3367 {
  label: "Explore Explore 3367"
  description: "Comprehensive analytics explore joining base view_10102 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10102
  
  always_filter: {
    filters: [view_10102.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10102.created_at_date: "7 days"]
    unless: [view_10102.id, view_10102.status]
  }

  join: view_10104 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10102.user_id} = ${view_10104.id} ;;
    required_joins: []
  }

  join: view_10105 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10102.account_id} = ${view_10105.account_id} ;;
    required_joins: [view_10104]
  }

  join: view_10106 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10102.category} = ${view_10106.category} ;;
  }

  access_filter: {
    field: view_10102.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10102.is_deleted} = false ;;
}
