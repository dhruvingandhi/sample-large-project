# Update for 500 file diff target
# Explore: explore_1665
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04996.view.lkml"
include: "/views/domain_48/view_04998.view.lkml"
include: "/views/domain_49/view_04999.view.lkml"
include: "/views/domain_50/view_05000.view.lkml"

explore: explore_1665 {
  label: "Explore Explore 1665"
  description: "Comprehensive analytics explore joining base view_04996 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04996
  
  always_filter: {
    filters: [view_04996.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04996.created_at_date: "7 days"]
    unless: [view_04996.id, view_04996.status]
  }

  join: view_04998 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04996.user_id} = ${view_04998.id} ;;
    required_joins: []
  }

  join: view_04999 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04996.account_id} = ${view_04999.account_id} ;;
    required_joins: [view_04998]
  }

  join: view_05000 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04996.category} = ${view_05000.category} ;;
  }

  access_filter: {
    field: view_04996.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04996.is_deleted} = false ;;
}
