# Explore: explore_1202
# Auto-generated LookML Explore File

include: "/views/domain_07/view_03607.view.lkml"
include: "/views/domain_09/view_03609.view.lkml"
include: "/views/domain_10/view_03610.view.lkml"
include: "/views/domain_11/view_03611.view.lkml"

explore: explore_1202 {
  label: "Explore Explore 1202"
  description: "Comprehensive analytics explore joining base view_03607 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03607
  
  always_filter: {
    filters: [view_03607.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03607.created_at_date: "7 days"]
    unless: [view_03607.id, view_03607.status]
  }

  join: view_03609 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03607.user_id} = ${view_03609.id} ;;
    required_joins: []
  }

  join: view_03610 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03607.account_id} = ${view_03610.account_id} ;;
    required_joins: [view_03609]
  }

  join: view_03611 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03607.category} = ${view_03611.category} ;;
  }

  access_filter: {
    field: view_03607.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03607.is_deleted} = false ;;
}
