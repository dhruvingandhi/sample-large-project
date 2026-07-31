# Update for 2000 file diff target
# Explore: explore_3678
# Auto-generated LookML Explore File

include: "/views/domain_35/view_11035.view.lkml"
include: "/views/domain_37/view_11037.view.lkml"
include: "/views/domain_38/view_11038.view.lkml"
include: "/views/domain_39/view_11039.view.lkml"

explore: explore_3678 {
  label: "Explore Explore 3678"
  description: "Comprehensive analytics explore joining base view_11035 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11035
  
  always_filter: {
    filters: [view_11035.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11035.created_at_date: "7 days"]
    unless: [view_11035.id, view_11035.status]
  }

  join: view_11037 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11035.user_id} = ${view_11037.id} ;;
    required_joins: []
  }

  join: view_11038 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11035.account_id} = ${view_11038.account_id} ;;
    required_joins: [view_11037]
  }

  join: view_11039 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11035.category} = ${view_11039.category} ;;
  }

  access_filter: {
    field: view_11035.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11035.is_deleted} = false ;;
}
