# Explore: explore_2857
# Auto-generated LookML Explore File

include: "/views/domain_22/view_08572.view.lkml"
include: "/views/domain_24/view_08574.view.lkml"
include: "/views/domain_25/view_08575.view.lkml"
include: "/views/domain_26/view_08576.view.lkml"

explore: explore_2857 {
  label: "Explore Explore 2857"
  description: "Comprehensive analytics explore joining base view_08572 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08572
  
  always_filter: {
    filters: [view_08572.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08572.created_at_date: "7 days"]
    unless: [view_08572.id, view_08572.status]
  }

  join: view_08574 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08572.user_id} = ${view_08574.id} ;;
    required_joins: []
  }

  join: view_08575 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08572.account_id} = ${view_08575.account_id} ;;
    required_joins: [view_08574]
  }

  join: view_08576 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08572.category} = ${view_08576.category} ;;
  }

  access_filter: {
    field: view_08572.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08572.is_deleted} = false ;;
}
