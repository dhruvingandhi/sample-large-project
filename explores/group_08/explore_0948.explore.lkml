# Explore: explore_0948
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02845.view.lkml"
include: "/views/domain_47/view_02847.view.lkml"
include: "/views/domain_48/view_02848.view.lkml"
include: "/views/domain_49/view_02849.view.lkml"

explore: explore_0948 {
  label: "Explore Explore 0948"
  description: "Comprehensive analytics explore joining base view_02845 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02845
  
  always_filter: {
    filters: [view_02845.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02845.created_at_date: "7 days"]
    unless: [view_02845.id, view_02845.status]
  }

  join: view_02847 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02845.user_id} = ${view_02847.id} ;;
    required_joins: []
  }

  join: view_02848 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02845.account_id} = ${view_02848.account_id} ;;
    required_joins: [view_02847]
  }

  join: view_02849 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02845.category} = ${view_02849.category} ;;
  }

  access_filter: {
    field: view_02845.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02845.is_deleted} = false ;;
}
