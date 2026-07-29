# Explore: explore_1588
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04765.view.lkml"
include: "/views/domain_17/view_04767.view.lkml"
include: "/views/domain_18/view_04768.view.lkml"
include: "/views/domain_19/view_04769.view.lkml"

explore: explore_1588 {
  label: "Explore Explore 1588"
  description: "Comprehensive analytics explore joining base view_04765 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04765
  
  always_filter: {
    filters: [view_04765.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04765.created_at_date: "7 days"]
    unless: [view_04765.id, view_04765.status]
  }

  join: view_04767 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04765.user_id} = ${view_04767.id} ;;
    required_joins: []
  }

  join: view_04768 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04765.account_id} = ${view_04768.account_id} ;;
    required_joins: [view_04767]
  }

  join: view_04769 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04765.category} = ${view_04769.category} ;;
  }

  access_filter: {
    field: view_04765.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04765.is_deleted} = false ;;
}
