# Explore: explore_0951
# Auto-generated LookML Explore File

include: "/views/domain_04/view_02854.view.lkml"
include: "/views/domain_06/view_02856.view.lkml"
include: "/views/domain_07/view_02857.view.lkml"
include: "/views/domain_08/view_02858.view.lkml"

explore: explore_0951 {
  label: "Explore Explore 0951"
  description: "Comprehensive analytics explore joining base view_02854 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02854
  
  always_filter: {
    filters: [view_02854.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02854.created_at_date: "7 days"]
    unless: [view_02854.id, view_02854.status]
  }

  join: view_02856 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02854.user_id} = ${view_02856.id} ;;
    required_joins: []
  }

  join: view_02857 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02854.account_id} = ${view_02857.account_id} ;;
    required_joins: [view_02856]
  }

  join: view_02858 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02854.category} = ${view_02858.category} ;;
  }

  access_filter: {
    field: view_02854.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02854.is_deleted} = false ;;
}
