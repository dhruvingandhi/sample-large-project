# Explore: explore_1245
# Auto-generated LookML Explore File

include: "/views/domain_36/view_03736.view.lkml"
include: "/views/domain_38/view_03738.view.lkml"
include: "/views/domain_39/view_03739.view.lkml"
include: "/views/domain_40/view_03740.view.lkml"

explore: explore_1245 {
  label: "Explore Explore 1245"
  description: "Comprehensive analytics explore joining base view_03736 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03736
  
  always_filter: {
    filters: [view_03736.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03736.created_at_date: "7 days"]
    unless: [view_03736.id, view_03736.status]
  }

  join: view_03738 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03736.user_id} = ${view_03738.id} ;;
    required_joins: []
  }

  join: view_03739 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03736.account_id} = ${view_03739.account_id} ;;
    required_joins: [view_03738]
  }

  join: view_03740 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03736.category} = ${view_03740.category} ;;
  }

  access_filter: {
    field: view_03736.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03736.is_deleted} = false ;;
}
