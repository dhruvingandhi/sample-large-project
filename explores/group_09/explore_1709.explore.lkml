# Explore: explore_1709
# Auto-generated LookML Explore File

include: "/views/domain_28/view_05128.view.lkml"
include: "/views/domain_30/view_05130.view.lkml"
include: "/views/domain_31/view_05131.view.lkml"
include: "/views/domain_32/view_05132.view.lkml"

explore: explore_1709 {
  label: "Explore Explore 1709"
  description: "Comprehensive analytics explore joining base view_05128 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05128
  
  always_filter: {
    filters: [view_05128.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05128.created_at_date: "7 days"]
    unless: [view_05128.id, view_05128.status]
  }

  join: view_05130 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05128.user_id} = ${view_05130.id} ;;
    required_joins: []
  }

  join: view_05131 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05128.account_id} = ${view_05131.account_id} ;;
    required_joins: [view_05130]
  }

  join: view_05132 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05128.category} = ${view_05132.category} ;;
  }

  access_filter: {
    field: view_05128.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05128.is_deleted} = false ;;
}
