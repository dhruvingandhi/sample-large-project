# Explore: explore_3571
# Auto-generated LookML Explore File

include: "/views/domain_14/view_10714.view.lkml"
include: "/views/domain_16/view_10716.view.lkml"
include: "/views/domain_17/view_10717.view.lkml"
include: "/views/domain_18/view_10718.view.lkml"

explore: explore_3571 {
  label: "Explore Explore 3571"
  description: "Comprehensive analytics explore joining base view_10714 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10714
  
  always_filter: {
    filters: [view_10714.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10714.created_at_date: "7 days"]
    unless: [view_10714.id, view_10714.status]
  }

  join: view_10716 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10714.user_id} = ${view_10716.id} ;;
    required_joins: []
  }

  join: view_10717 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10714.account_id} = ${view_10717.account_id} ;;
    required_joins: [view_10716]
  }

  join: view_10718 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10714.category} = ${view_10718.category} ;;
  }

  access_filter: {
    field: view_10714.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10714.is_deleted} = false ;;
}
