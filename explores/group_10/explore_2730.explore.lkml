# Update for 2000 file diff target
# Explore: explore_2730
# Auto-generated LookML Explore File

include: "/views/domain_41/view_08191.view.lkml"
include: "/views/domain_43/view_08193.view.lkml"
include: "/views/domain_44/view_08194.view.lkml"
include: "/views/domain_45/view_08195.view.lkml"

explore: explore_2730 {
  label: "Explore Explore 2730"
  description: "Comprehensive analytics explore joining base view_08191 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08191
  
  always_filter: {
    filters: [view_08191.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08191.created_at_date: "7 days"]
    unless: [view_08191.id, view_08191.status]
  }

  join: view_08193 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08191.user_id} = ${view_08193.id} ;;
    required_joins: []
  }

  join: view_08194 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08191.account_id} = ${view_08194.account_id} ;;
    required_joins: [view_08193]
  }

  join: view_08195 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08191.category} = ${view_08195.category} ;;
  }

  access_filter: {
    field: view_08191.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08191.is_deleted} = false ;;
}
