# Explore: explore_2295
# Auto-generated LookML Explore File

include: "/views/domain_36/view_06886.view.lkml"
include: "/views/domain_38/view_06888.view.lkml"
include: "/views/domain_39/view_06889.view.lkml"
include: "/views/domain_40/view_06890.view.lkml"

explore: explore_2295 {
  label: "Explore Explore 2295"
  description: "Comprehensive analytics explore joining base view_06886 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06886
  
  always_filter: {
    filters: [view_06886.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06886.created_at_date: "7 days"]
    unless: [view_06886.id, view_06886.status]
  }

  join: view_06888 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06886.user_id} = ${view_06888.id} ;;
    required_joins: []
  }

  join: view_06889 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06886.account_id} = ${view_06889.account_id} ;;
    required_joins: [view_06888]
  }

  join: view_06890 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06886.category} = ${view_06890.category} ;;
  }

  access_filter: {
    field: view_06886.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06886.is_deleted} = false ;;
}
