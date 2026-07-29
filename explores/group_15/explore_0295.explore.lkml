# Explore: explore_0295
# Auto-generated LookML Explore File

include: "/views/domain_36/view_00886.view.lkml"
include: "/views/domain_38/view_00888.view.lkml"
include: "/views/domain_39/view_00889.view.lkml"
include: "/views/domain_40/view_00890.view.lkml"

explore: explore_0295 {
  label: "Explore Explore 0295"
  description: "Comprehensive analytics explore joining base view_00886 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00886
  
  always_filter: {
    filters: [view_00886.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00886.created_at_date: "7 days"]
    unless: [view_00886.id, view_00886.status]
  }

  join: view_00888 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00886.user_id} = ${view_00888.id} ;;
    required_joins: []
  }

  join: view_00889 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00886.account_id} = ${view_00889.account_id} ;;
    required_joins: [view_00888]
  }

  join: view_00890 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00886.category} = ${view_00890.category} ;;
  }

  access_filter: {
    field: view_00886.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00886.is_deleted} = false ;;
}
