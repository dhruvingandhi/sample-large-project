# Update for 2000 file diff target
# Explore: explore_3959
# Auto-generated LookML Explore File

include: "/views/domain_28/view_11878.view.lkml"
include: "/views/domain_30/view_11880.view.lkml"
include: "/views/domain_31/view_11881.view.lkml"
include: "/views/domain_32/view_11882.view.lkml"

explore: explore_3959 {
  label: "Explore Explore 3959"
  description: "Comprehensive analytics explore joining base view_11878 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11878
  
  always_filter: {
    filters: [view_11878.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11878.created_at_date: "7 days"]
    unless: [view_11878.id, view_11878.status]
  }

  join: view_11880 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11878.user_id} = ${view_11880.id} ;;
    required_joins: []
  }

  join: view_11881 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11878.account_id} = ${view_11881.account_id} ;;
    required_joins: [view_11880]
  }

  join: view_11882 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11878.category} = ${view_11882.category} ;;
  }

  access_filter: {
    field: view_11878.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11878.is_deleted} = false ;;
}
