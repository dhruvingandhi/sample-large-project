# Update for 2000 file diff target
# Explore: explore_2620
# Auto-generated LookML Explore File

include: "/views/domain_11/view_07861.view.lkml"
include: "/views/domain_13/view_07863.view.lkml"
include: "/views/domain_14/view_07864.view.lkml"
include: "/views/domain_15/view_07865.view.lkml"

explore: explore_2620 {
  label: "Explore Explore 2620"
  description: "Comprehensive analytics explore joining base view_07861 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07861
  
  always_filter: {
    filters: [view_07861.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07861.created_at_date: "7 days"]
    unless: [view_07861.id, view_07861.status]
  }

  join: view_07863 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07861.user_id} = ${view_07863.id} ;;
    required_joins: []
  }

  join: view_07864 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07861.account_id} = ${view_07864.account_id} ;;
    required_joins: [view_07863]
  }

  join: view_07865 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07861.category} = ${view_07865.category} ;;
  }

  access_filter: {
    field: view_07861.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07861.is_deleted} = false ;;
}
