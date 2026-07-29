# Explore: explore_2805
# Auto-generated LookML Explore File

include: "/views/domain_16/view_08416.view.lkml"
include: "/views/domain_18/view_08418.view.lkml"
include: "/views/domain_19/view_08419.view.lkml"
include: "/views/domain_20/view_08420.view.lkml"

explore: explore_2805 {
  label: "Explore Explore 2805"
  description: "Comprehensive analytics explore joining base view_08416 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08416
  
  always_filter: {
    filters: [view_08416.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08416.created_at_date: "7 days"]
    unless: [view_08416.id, view_08416.status]
  }

  join: view_08418 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08416.user_id} = ${view_08418.id} ;;
    required_joins: []
  }

  join: view_08419 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08416.account_id} = ${view_08419.account_id} ;;
    required_joins: [view_08418]
  }

  join: view_08420 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08416.category} = ${view_08420.category} ;;
  }

  access_filter: {
    field: view_08416.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08416.is_deleted} = false ;;
}
