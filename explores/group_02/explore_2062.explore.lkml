# Explore: explore_2062
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06187.view.lkml"
include: "/views/domain_39/view_06189.view.lkml"
include: "/views/domain_40/view_06190.view.lkml"
include: "/views/domain_41/view_06191.view.lkml"

explore: explore_2062 {
  label: "Explore Explore 2062"
  description: "Comprehensive analytics explore joining base view_06187 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06187
  
  always_filter: {
    filters: [view_06187.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06187.created_at_date: "7 days"]
    unless: [view_06187.id, view_06187.status]
  }

  join: view_06189 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06187.user_id} = ${view_06189.id} ;;
    required_joins: []
  }

  join: view_06190 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06187.account_id} = ${view_06190.account_id} ;;
    required_joins: [view_06189]
  }

  join: view_06191 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06187.category} = ${view_06191.category} ;;
  }

  access_filter: {
    field: view_06187.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06187.is_deleted} = false ;;
}
