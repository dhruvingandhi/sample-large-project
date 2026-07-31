# Update for 2000 file diff target
# Explore: explore_1059
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03178.view.lkml"
include: "/views/domain_30/view_03180.view.lkml"
include: "/views/domain_31/view_03181.view.lkml"
include: "/views/domain_32/view_03182.view.lkml"

explore: explore_1059 {
  label: "Explore Explore 1059"
  description: "Comprehensive analytics explore joining base view_03178 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03178
  
  always_filter: {
    filters: [view_03178.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03178.created_at_date: "7 days"]
    unless: [view_03178.id, view_03178.status]
  }

  join: view_03180 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03178.user_id} = ${view_03180.id} ;;
    required_joins: []
  }

  join: view_03181 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03178.account_id} = ${view_03181.account_id} ;;
    required_joins: [view_03180]
  }

  join: view_03182 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03178.category} = ${view_03182.category} ;;
  }

  access_filter: {
    field: view_03178.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03178.is_deleted} = false ;;
}
