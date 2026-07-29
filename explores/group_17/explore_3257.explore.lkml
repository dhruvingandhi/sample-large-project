# Explore: explore_3257
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09772.view.lkml"
include: "/views/domain_24/view_09774.view.lkml"
include: "/views/domain_25/view_09775.view.lkml"
include: "/views/domain_26/view_09776.view.lkml"

explore: explore_3257 {
  label: "Explore Explore 3257"
  description: "Comprehensive analytics explore joining base view_09772 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09772
  
  always_filter: {
    filters: [view_09772.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09772.created_at_date: "7 days"]
    unless: [view_09772.id, view_09772.status]
  }

  join: view_09774 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09772.user_id} = ${view_09774.id} ;;
    required_joins: []
  }

  join: view_09775 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09772.account_id} = ${view_09775.account_id} ;;
    required_joins: [view_09774]
  }

  join: view_09776 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09772.category} = ${view_09776.category} ;;
  }

  access_filter: {
    field: view_09772.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09772.is_deleted} = false ;;
}
