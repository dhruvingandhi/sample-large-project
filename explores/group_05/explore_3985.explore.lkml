# Update for 500 file diff target
# Explore: explore_3985
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11956.view.lkml"
include: "/views/domain_08/view_11958.view.lkml"
include: "/views/domain_09/view_11959.view.lkml"
include: "/views/domain_10/view_11960.view.lkml"

explore: explore_3985 {
  label: "Explore Explore 3985"
  description: "Comprehensive analytics explore joining base view_11956 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11956
  
  always_filter: {
    filters: [view_11956.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11956.created_at_date: "7 days"]
    unless: [view_11956.id, view_11956.status]
  }

  join: view_11958 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11956.user_id} = ${view_11958.id} ;;
    required_joins: []
  }

  join: view_11959 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11956.account_id} = ${view_11959.account_id} ;;
    required_joins: [view_11958]
  }

  join: view_11960 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11956.category} = ${view_11960.category} ;;
  }

  access_filter: {
    field: view_11956.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11956.is_deleted} = false ;;
}
