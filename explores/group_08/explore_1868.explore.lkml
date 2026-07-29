# Explore: explore_1868
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05605.view.lkml"
include: "/views/domain_07/view_05607.view.lkml"
include: "/views/domain_08/view_05608.view.lkml"
include: "/views/domain_09/view_05609.view.lkml"

explore: explore_1868 {
  label: "Explore Explore 1868"
  description: "Comprehensive analytics explore joining base view_05605 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05605
  
  always_filter: {
    filters: [view_05605.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05605.created_at_date: "7 days"]
    unless: [view_05605.id, view_05605.status]
  }

  join: view_05607 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05605.user_id} = ${view_05607.id} ;;
    required_joins: []
  }

  join: view_05608 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05605.account_id} = ${view_05608.account_id} ;;
    required_joins: [view_05607]
  }

  join: view_05609 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05605.category} = ${view_05609.category} ;;
  }

  access_filter: {
    field: view_05605.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05605.is_deleted} = false ;;
}
