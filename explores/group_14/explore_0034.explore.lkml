# Explore: explore_0034
# Auto-generated LookML Explore File

include: "/views/domain_03/view_00103.view.lkml"
include: "/views/domain_05/view_00105.view.lkml"
include: "/views/domain_06/view_00106.view.lkml"
include: "/views/domain_07/view_00107.view.lkml"

explore: explore_0034 {
  label: "Explore Explore 0034"
  description: "Comprehensive analytics explore joining base view_00103 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00103
  
  always_filter: {
    filters: [view_00103.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00103.created_at_date: "7 days"]
    unless: [view_00103.id, view_00103.status]
  }

  join: view_00105 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00103.user_id} = ${view_00105.id} ;;
    required_joins: []
  }

  join: view_00106 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00103.account_id} = ${view_00106.account_id} ;;
    required_joins: [view_00105]
  }

  join: view_00107 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00103.category} = ${view_00107.category} ;;
  }

  access_filter: {
    field: view_00103.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00103.is_deleted} = false ;;
}
