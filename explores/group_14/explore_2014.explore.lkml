# Explore: explore_2014
# Auto-generated LookML Explore File

include: "/views/domain_43/view_06043.view.lkml"
include: "/views/domain_45/view_06045.view.lkml"
include: "/views/domain_46/view_06046.view.lkml"
include: "/views/domain_47/view_06047.view.lkml"

explore: explore_2014 {
  label: "Explore Explore 2014"
  description: "Comprehensive analytics explore joining base view_06043 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06043
  
  always_filter: {
    filters: [view_06043.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06043.created_at_date: "7 days"]
    unless: [view_06043.id, view_06043.status]
  }

  join: view_06045 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06043.user_id} = ${view_06045.id} ;;
    required_joins: []
  }

  join: view_06046 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06043.account_id} = ${view_06046.account_id} ;;
    required_joins: [view_06045]
  }

  join: view_06047 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06043.category} = ${view_06047.category} ;;
  }

  access_filter: {
    field: view_06043.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06043.is_deleted} = false ;;
}
