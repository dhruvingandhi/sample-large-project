# Update for 2000 file diff target
# Explore: explore_0678
# Auto-generated LookML Explore File

include: "/views/domain_35/view_02035.view.lkml"
include: "/views/domain_37/view_02037.view.lkml"
include: "/views/domain_38/view_02038.view.lkml"
include: "/views/domain_39/view_02039.view.lkml"

explore: explore_0678 {
  label: "Explore Explore 0678"
  description: "Comprehensive analytics explore joining base view_02035 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02035
  
  always_filter: {
    filters: [view_02035.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02035.created_at_date: "7 days"]
    unless: [view_02035.id, view_02035.status]
  }

  join: view_02037 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02035.user_id} = ${view_02037.id} ;;
    required_joins: []
  }

  join: view_02038 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02035.account_id} = ${view_02038.account_id} ;;
    required_joins: [view_02037]
  }

  join: view_02039 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02035.category} = ${view_02039.category} ;;
  }

  access_filter: {
    field: view_02035.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02035.is_deleted} = false ;;
}
