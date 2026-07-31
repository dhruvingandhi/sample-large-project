# Update for 2000 file diff target
# Explore: explore_0620
# Auto-generated LookML Explore File

include: "/views/domain_11/view_01861.view.lkml"
include: "/views/domain_13/view_01863.view.lkml"
include: "/views/domain_14/view_01864.view.lkml"
include: "/views/domain_15/view_01865.view.lkml"

explore: explore_0620 {
  label: "Explore Explore 0620"
  description: "Comprehensive analytics explore joining base view_01861 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01861
  
  always_filter: {
    filters: [view_01861.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01861.created_at_date: "7 days"]
    unless: [view_01861.id, view_01861.status]
  }

  join: view_01863 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01861.user_id} = ${view_01863.id} ;;
    required_joins: []
  }

  join: view_01864 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01861.account_id} = ${view_01864.account_id} ;;
    required_joins: [view_01863]
  }

  join: view_01865 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01861.category} = ${view_01865.category} ;;
  }

  access_filter: {
    field: view_01861.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01861.is_deleted} = false ;;
}
