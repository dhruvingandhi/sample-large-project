# Explore: explore_2763
# Auto-generated LookML Explore File

include: "/views/domain_40/view_08290.view.lkml"
include: "/views/domain_42/view_08292.view.lkml"
include: "/views/domain_43/view_08293.view.lkml"
include: "/views/domain_44/view_08294.view.lkml"

explore: explore_2763 {
  label: "Explore Explore 2763"
  description: "Comprehensive analytics explore joining base view_08290 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08290
  
  always_filter: {
    filters: [view_08290.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08290.created_at_date: "7 days"]
    unless: [view_08290.id, view_08290.status]
  }

  join: view_08292 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08290.user_id} = ${view_08292.id} ;;
    required_joins: []
  }

  join: view_08293 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08290.account_id} = ${view_08293.account_id} ;;
    required_joins: [view_08292]
  }

  join: view_08294 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08290.category} = ${view_08294.category} ;;
  }

  access_filter: {
    field: view_08290.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08290.is_deleted} = false ;;
}
