# Explore: explore_3622
# Auto-generated LookML Explore File

include: "/views/domain_17/view_10867.view.lkml"
include: "/views/domain_19/view_10869.view.lkml"
include: "/views/domain_20/view_10870.view.lkml"
include: "/views/domain_21/view_10871.view.lkml"

explore: explore_3622 {
  label: "Explore Explore 3622"
  description: "Comprehensive analytics explore joining base view_10867 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10867
  
  always_filter: {
    filters: [view_10867.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10867.created_at_date: "7 days"]
    unless: [view_10867.id, view_10867.status]
  }

  join: view_10869 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10867.user_id} = ${view_10869.id} ;;
    required_joins: []
  }

  join: view_10870 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10867.account_id} = ${view_10870.account_id} ;;
    required_joins: [view_10869]
  }

  join: view_10871 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10867.category} = ${view_10871.category} ;;
  }

  access_filter: {
    field: view_10867.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10867.is_deleted} = false ;;
}
